json.articles do
	json.array! @articles do |article|
    	json.title article.title
    	json.description article.description
	end
end