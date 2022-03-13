namespace :export_to_csv do
    desc "export to csv"
    task :data_export => [:environment] do
        require 'csv'

        file = "#{Rails.root}/public/ingredients.csv"

        #products = Product.order(:first_name)
        states = Ingredient.order(:name)

        headers = ["id","name","state_id","location_id","user_id","global"]

        CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
            states.each do |state|
                writer << [state.id, state.name, state.state_id,state.location_id,state.user_id,state.global]
            end
        end
    end
end
