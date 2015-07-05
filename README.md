# Yes You Cam
## A **Ridiculous**ly Simple BluePotion Camera Library to help you achieve your dreams...
![Don't Shia Way](_art/yyc.png)

## Usage

### Take a Photo

```ruby
  # First - Fire off a photo
  YesYouCam.capture_photo
```

### React on Take a Photo Completion
```ruby
  # called in BluePotion when the photo has been taken (or any activity is completed actually)
  # If you're not using a PMActivity you should capture the onActivityResult method.
  def activity_result(request_code, result_code, data)
    if (result_code == YesYouCam.OK) # OR Android::App::Activity::RESULT_OK
      # Photo success!
      p "Photo located at #{YesYouCam.photo_path}"
    else
      # Photo failed or was cancelled
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

### Need the photo discoverable by Photo Libraries?
```ruby
# TODO
```

### Let the user select a photo from their library?
```ruby
# TODO
```


## Installation

Add this line to your application's Gemfile:

    gem 'yesyoucam'

And then execute:

    $ bundle

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Order some mexican food and beat a piñata
6. Create new Pull Request
