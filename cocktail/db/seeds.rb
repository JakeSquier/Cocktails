# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'json'
data = [{"idDrink":"11007","strDrink":"Margarita","strDrinkAlternate":nil,"strDrinkES":nil,"strDrinkDE":nil,"strDrinkFR":nil,"strDrinkZH-HANS":nil,"strDrinkZH-HANT":nil,"strTags":"IBA,ContemporaryClassic","strVideo":nil,"strCategory":"Ordinary Drink","strIBA":"Contemporary Classics","strAlcoholic":"Alcoholic","strGlass":"Cocktail glass","strInstructions":"Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.","strInstructionsES":nil,"strInstructionsDE":"Reiben Sie den Rand des Glases mit der Limettenscheibe, damit das Salz daran haftet. Achten Sie darauf, dass nur der \u00e4u\u00dfere Rand angefeuchtet wird und streuen Sie das Salz darauf. Das Salz sollte sich auf den Lippen des Genie\u00dfers befinden und niemals in den Cocktail einmischen. Die anderen Zutaten mit Eis sch\u00fctteln und vorsichtig in das Glas geben.","strInstructionsFR":nil,"strInstructionsZH-HANS":nil,"strInstructionsZH-HANT":nil,"strDrinkThumb":"https:\/\/www.thecocktaildb.com\/images\/media\/drink\/5noda61589575158.jpg","strIngredient1":"Tequila","strIngredient2":"Triple sec","strIngredient3":"Lime juice","strIngredient4":"Salt","strIngredient5":nil,"strIngredient6":nil,"strIngredient7":nil,"strIngredient8":nil,"strIngredient9":nil,"strIngredient10":nil,"strIngredient11":nil,"strIngredient12":nil,"strIngredient13":nil,"strIngredient14":nil,"strIngredient15":nil,"strMeasure1":"1 1\/2 oz ","strMeasure2":"1\/2 oz ","strMeasure3":"1 oz ","strMeasure4":nil,"strMeasure5":nil,"strMeasure6":nil,"strMeasure7":nil,"strMeasure8":nil,"strMeasure9":nil,"strMeasure10":nil,"strMeasure11":nil,"strMeasure12":nil,"strMeasure13":nil,"strMeasure14":nil,"strMeasure15":nil,"strCreativeCommonsConfirmed":"Yes","dateModified":"2015-08-18 14:42:59"}]
# cleanData = JSON.parse(data)
# byebug
#slat serhaerthnaenaenq
#fdanafdnaenanasetnatejn
#Drink.create("idDrink":"11007","strDrink":"Margarita","strDrinkAlternate":nil,"strDrinkES":nil,"strDrinkDE":nil,"strDrinkFR":nil,"strDrinkZH-HANS":nil,"strDrinkZH-HANT":nil,"strTags":"IBA,ContemporaryClassic","strVideo" nil,"strCategory":"Ordinary Drink","strIBA":"Contemporary Classics","strAlcoholic":"Alcoholic","strGlass":"Cocktail glass","strInstructions":"Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.","strInstructionsES":nil,"strInstructionsDE":"Reiben Sie den Rand des Glases mit der Limettenscheibe, damit das Salz daran haftet. Achten Sie darauf, dass nur der \u00e4u\u00dfere Rand angefeuchtet wird und streuen Sie das Salz darauf. Das Salz sollte sich auf den Lippen des Genie\u00dfers befinden und niemals in den Cocktail einmischen. Die anderen Zutaten mit Eis sch\u00fctteln und vorsichtig in das Glas geben.","strInstructionsFR":nil,"strInstructionsZH-HANS":nil,"strInstructionsZH-HANT":nil,"strDrinkThumb":"https:\/\/www.thecocktaildb.com\/images\/media\/drink\/5noda61589575158.jpg","strIngredient1":"Tequila","strIngredient2":"Triple sec","strIngredient3":"Lime juice","strIngredient4":"Salt","strIngredient5" nil,"strIngredient6" nil,"strIngredient7" nil,"strIngredient8" nil,"strIngredient9" nil,"strIngredient10" nil,"strIngredient11" nil,"strIngredient12" nil,"strIngredient13" nil,"strIngredient14" nil,"strIngredient15" nil,"strMeasure1":"1 1\/2 oz ","strMeasure2":"1\/2 oz ","strMeasure3":"1 oz ","strMeasure4" nil,"strMeasure5" nil,"strMeasure6" nil,"strMeasure7" nil,"strMeasure8" nil,"strMeasure9" nil,"strMeasure10" nil,"strMeasure11" nil,"strMeasure12" nil,"strMeasure13" nil,"strMeasure14" nil,"strMeasure15" nil,"strCreativeCommonsConfirmed":"Yes","dateModified":"2015-08-18 14:42:59")
Drink.destroy_all

def create_ingredients(drink)
    drink_id = Drink.fetch_id(drink[:strDrink])
    drink.each do |key, val|
        if key[0..5] == "strIng"
            Ingredient.create(name: val) if Ingredient.existing(val) == false
            DrinkIngredient.create(ingredient_id: Ingredient.fetch_id(val), drink_id: drink_id) if val != nil
        end 

    end 
end 

def seedDB(data)
    data[:drinks].each do |drink|
        #byebug
        Drink.create(
            name: drink[:strDrink],
            category: drink[:strCategory],
            glass: drink[:strGlass],
            alcoholic: drink[:strAlcoholic],
            instructions: drink[:strInstructions],
            img_url: drink[:strDrinkThumb]
        )
        create_ingredients(drink)

    end 
    puts "hi"
end 
User.create(first_name: 'Jake', last_name: 'Squier', age: 18, email: 'Jacob.squier@gmail.com')
seedDB(drinks: [{idDrink:"11007", strDrink: "Margarita", strDrinkAlternate: nil, strDrinkES: nil, strDrinkDE: nil, strDrinkFR: nil, strTags: "IBA,ContemporaryClassic", strVideo: nil, strCategory: "Ordinary Drink", strIBA: "Contemporary Classics", strAlcoholic: "Alcoholic", strGlass: "Cocktail glass", strInstructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.", strDrinkThumb: "https:\/\/www.thecocktaildb.com\/images\/media\/drink\/5noda61589575158.jpg", strIngredient1:"Tequila", strIngredient2: "Triple sec", strIngredient3: "Lime juice", strIngredient: "Salt", strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strMeasure1: "1 1\/2 oz ", strMeasure2: "1\/2 oz ", strMeasure3: "1 oz ", strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strCreativeCommonsConfirmed: "Yes", dateModified: "2015-08-18 14:42:59"}])
#seedDB(data)