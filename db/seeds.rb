require 'json'
require 'pry'
require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = 'https://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=60007'

response = RestClient.get(url)

data= JSON.parse(response)

array=[]

  data["results"].each do |article, index|
    new_market= {}
    new_market[:id]= article["id"]
    new_market[:name]= article["marketname"]

    array << new_market
  end


index= "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id="

  array.each do |market|

    answer= RestClient.get("#{index}"+"#{market[:id]}")
    info= JSON.parse(answer)
    
    name= market[:name]
    address= info["marketdetails"]["Address"]
    glink=  info["marketdetails"]["GoogleLink"]
    products=  info["marketdetails"]["Products"]
    schedule=  info["marketdetails"]["Schedule"]

    Market.create(name: name, address: address, GoogleLink: glink, products: products, schedule: schedule)

  end
