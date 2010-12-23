class DocumentCreator
  def DocumentCreator.create_document(file_type)
    return ( eval(file_type.capitalize+".new") )
  end
end
