# Yes You Cam
## A **Ridiculous**ly Simple BluePotion Camera Library to help you achieve your dreams...
![Don't Shia Way](_art/yyc.png)

## Usage ("Nothing is impossible")

### Take a Photo

```ruby
  # Fire off a photo taking request
  # Returns true if camera intent is presented to the user.
  # Depends on camera existence (YesYouCam.camera_exists?)
  YesYouCam.capture_photo
```

### On Take a Photo Completion - Get Photo
```ruby
  # called in BluePotion when the photo has been taken (or any activity is completed actually)
  # If you're not using a PMActivity you should capture the onActivityResult method.
  def activity_result(request_code, result_code, data)
    # Verify this activity was for us!
    if (request_code == YesYouCam::CAPTURE_IMAGE_RC)
      if (result_code == YesYouCam::OK) # OR Android::App::Activity::RESULT_OK
        # Photo success!
        p "Full sized photo located at #{YesYouCam.photo_path}"
        # I sure could use a thumbnail!
        thumbnail = YesYouCam.make_thumbnail(data)
        # now you can do some_image_view.imageBitmap = thumbnail
      else
        # Photo failed or was cancelled
      end
    end
  end
```

### Want a PNG?
```ruby
  # Did you need a PNG instead of a JPG?
  YesYouCam.photo_path # Some JPG path
  YesYouCam.pic_to_png
  YesYouCam.photo_path # Some new PNG path
```

### Need the photo discoverable by Photo Libraries and other Apps?
```ruby
  # Run this and the current photo (YesYouCam.photo_path) will be
  # added to the user's Photo Gallery, and accessible by all apps.
  YesYouCam.add_to_gallery
```

### Let the user select a photo from their library?
```ruby
  # Fire off a photo choose request
  YesYouCam.choose_photo
```


## Installation

Add this line to your application's Gemfile:

    gem 'yesyoucam'

And then execute:

    $ bundle

Now make sure your `Rakefile` has camera permissions and features needed:
    # This gem will try to add permissions, but it's best that you assure they are set!
    app.permissions += [:write_external_storage]
    # This gem will add this feature, but it's safest for you to also set it!
    app.features = ["android.hardware.camera"]


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Order some mexican food and beat a piñata
6. Create new Pull Request
