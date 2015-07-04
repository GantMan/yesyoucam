# Yes You Cam
## A **Ridiculous**ly Simple BluePotion Camera Library to help you achieve your dreams...
![Don't Shia Way](_art/yyc.png)

## Usage

```ruby
  # First - Fire off a photo
  YesYouCam.capture_photo
```

### Need to know
```ruby
  # called when the photo has been taken
  def activity_result(request_code, result_code, data)
    if (result_code == YesYouCam.OK) # OR Android::App::Activity::RESULT_OK
      # Photo success!
      p "Photo located at #{YesYouCam.photo_path}"
    else
      # Photo failed or was cancelled
    end
  end
```

### JPG by default, but PNG is easy
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

### Let's let the user select a photo from their library!
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
