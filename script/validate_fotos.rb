# In order to use it:
#~/RoR/obelisk$ rails runner script/validate_fotos.rb -e production

Product.transaction do

  products            = Product.all
  existing_foto_names = Dir.glob("public/images/foto/*.*").to_a

  products.each() do |product|
    if (product.small_image_name != nil)
      existing_foto_names.delete('public' + product.small_image_name)
    end
    if (product.big_image_name != nil)
      existing_foto_names.delete('public' + product.big_image_name)
    end
    if (product.extra_image_name != nil)
      existing_foto_names.delete('public' + product.extra_image_name)
    end
  end

  if (existing_foto_names.empty?)
    print "No files should be removed", "\n"
  else
    print "This files was removed as no products rely on it:", "\n"

    existing_foto_names.each() do |f|
      print f, "\n"
      File.delete('/home/ppolushkin/RoR/obelisk/' + f)
    end
  end


  print "Validating products", "\n"

  Product.transaction do
    products.each() do |product|
      if (product.small_image_name != nil)
        if (!File.exist?('/home/ppolushkin/RoR/obelisk/public' + product.small_image_name))
          print "There is no small foto for " + product.article + " !", "\n"
        end
      end
      if (product.big_image_name != nil)
        if (!File.exist?('/home/ppolushkin/RoR/obelisk/public' + product.big_image_name))
          print "There is no big foto for " + product.article + " !", "\n"
        end
      end
      print product.extra_image_name, "\n"
      if (product.extra_image_name != nil)
        if (!File.exist?('/home/ppolushkin/RoR/obelisk/public' + product.extra_image_name))
          print "set extra_image_name to null for product " + product.article + " as there is no foto for it", "\n"
          product.extra_image_name = nil
          product.save
        end
      end
    end
  end

end
