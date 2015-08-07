class YesYouCam
  OK = Android::App::Activity::RESULT_OK
  CAPTURE_IMAGE_RC = 100
  CHOOSE_IMAGE_RC = 101
  DATA = "_data" # MediaStore.Images.Media.DATA

  class << self


    @current_photo_path = nil


    # Returns true or false on success of firing a photo intent
    def capture_photo
      success = false
      if camera_exists?
        # Performing this check is important because if you call startActivityForResult
        # using an intent that no app can handle, your app will crash.
        # So as long as the result is not nil, it's safe to use the intent.
        take_picture_intent = Potion::Intent.new(Potion::MediaStore::ACTION_IMAGE_CAPTURE)
        if take_picture_intent.resolveActivity(app.package_manager)
          # create place for photo to go
          photo_file = create_image_file

          if photo_file
            take_picture_intent.putExtra(Potion::MediaStore::EXTRA_OUTPUT, Potion::Uri.fromFile(photo_file))
            find.activity.startActivityForResult(take_picture_intent, YesYouCam::CAPTURE_IMAGE_RC)
            success = true
          end
        end
      end
      success
    end

    def choose_photo
      choose_pic = Potion::Intent.new(Potion::Intent::ACTION_PICK, Potion::INTERNAL_CONTENT_URI)
      find.activity.startActivityForResult(choose_pic, YesYouCam::CHOOSE_IMAGE_RC)
    end

    def pic_to_png(quality=100)
      bmp = Potion::BitmapFactory.decodeFile(@current_photo_path)
      # NOTE the instance var for current photo changes with this command
      create_image_file("png")
      image = Potion::File.new(@current_photo_path)
      out_stream = Potion::FileOutputStream.new(image)
      bmp.compress(Android::Graphics::Bitmap::CompressFormat::PNG, quality, out_stream)
      out_stream.flush
      out_stream.close
    end

    def photo_path
      @current_photo_path
    end

    def bmp_data(optional_path=nil)
      file_path = optional_path ? optional_path : photo_path
      Android::Graphics::BitmapFactory.decodeFile(file_path)
    end

    def camera_exists?
      find.app.package_manager.hasSystemFeature("android.hardware.camera")
    end

    def add_to_gallery
      media_scan_intent = Potion::Intent.new(Potion::Intent::ACTION_MEDIA_SCANNER_SCAN_FILE)
      photo_file = Potion::File.new(photo_path)
      content_uri = Potion::Uri.fromFile(photo_file)
      media_scan_intent.setData(content_uri)
      find.app.context.sendBroadcast(media_scan_intent)
    end

    def pic_path_from_uri (content_uri)
      cursor = find.app.context.contentResolver.query(content_uri, nil, nil, nil, nil)
      column_index = cursor.getColumnIndex(YesYouCam::DATA)
      path = nil
      cursor.moveToFirst

      # Some devices have SD cards/google services that make this a living hell... protect the user!
      if column_index >= 0
        path = cursor.getString(column_index)
      else
        # We're probably on an SD card - check common places (We're not the first one to attempt this terrible idea... DAMN YOU ANDROID!)
        external = Potion::Environment.getExternalStorageDirectory.getAbsolutePath
        dcim = Potion::Environment.getExternalStoragePublicDirectory(Potion::Environment::DIRECTORY_DCIM).getAbsolutePath
        pictures = Potion::Environment.getExternalStoragePublicDirectory(Potion::Environment::DIRECTORY_PICTURES).getAbsolutePath

        potential_dirs = ["#{dcim}/Camera/", "#{dcim}/100Media/", "#{dcim}/100ANDRO/", "#{dcim}/100LGDSC/", "#{external}/Images/", "#{pictures}/", "#{dcim}"]

        potential_dirs.each do |current_path|
          potential_file = current_path + cursor.getString(0)
          path = potential_file if Potion::File.new(potential_file).exists
          break if path #shortcircuit now that we've found it!
        end
      end

      cursor.close

      path
    end

    private

    def create_image_file(extension="jpg")
      file_name = "#{app.name}_#{Time.now.to_i}"
      storage_dir = Potion::Environment.getExternalStoragePublicDirectory(Potion::Environment::DIRECTORY_PICTURES)
      image_file = Potion::File.createTempFile(file_name, ".#{extension}", storage_dir)

      @current_photo_path = "#{image_file.getAbsolutePath}"
      image_file
    end

  end # close eigenclass
end

