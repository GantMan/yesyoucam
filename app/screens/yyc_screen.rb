class YYCScreen < PMScreen
  title "Welcome"
  stylesheet YYCScreenStylesheet

  def on_load
    mp "HAI"
  end
end