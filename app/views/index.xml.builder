xml.articles do
	@articles.each do |article|
		xml.article do
    		xml.title article.title
    		xml.description article.description
    	end
	end
end