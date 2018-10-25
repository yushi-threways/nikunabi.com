crumb :root do
  link "ニクナビ", root_path
end

crumb :shops do
  link "焼肉店一覧", shops_path
  parent :root
end

crumb :shops_city do |shop|
  link "#{shop.city[:city]}の焼肉店", shops_city_path(shop.city_id)
  parent :shops
end

crumb :show_shop do |shop|
  link shop.name, shops_city_shop_path(shop.city_id, shop)
  parent :shops_city, shop
end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
