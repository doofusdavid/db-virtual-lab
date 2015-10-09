# Installing MongoDB

1. Start weblab VM
2. Log in
3. Open a terminal
4. Import the public key used by the package management system

		sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

5. Create a list file for MongoDB

		echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list 

6. Update the apt-get packages

		sudo apt-get update

7. Install the latest stabl version of MongoDB

		sudo apt-get install -y mongodb

# Running MongoDB
1. Start the server if it isn't already

		sudo service mongod start

2. Verify that the service is awaiting input

		tail /var/log/mongodb/mongod.log 

you should see this line:

		[initandlisten] waiting for connections on port <port>

# Connect to MongoDB
1. Retrieve the sample restaurants data

		wget https://raw.githubusercontent.com/mongodb/docs-assets/primer-dataset/dataset.json 

2. import the data into the collection

		mongoimport --db test --collection restaurants --drop --file dataset.json

3. Start the mongo shell

		mongo

4. Tell mongo which database you will be using

		use test

5. Return all restaurants 

		db.restaurants.find()

6. Make it prettier

		db.restaurants.find().pretty()

7. Search for a restaurant

		db.restaurants.find({"borough" : "Brooklyn"}).pretty() 

8. Search with a wildcard

		db.restaurants.find({"name": /Nordic/}).pretty()

9. Insert into restaurants

		db.restaurants.insert(
		   {
		      "address" : {
		         "street" : "2 Avenue",
		         "zipcode" : "10075",
		         "building" : "1480",
		         "coord" : [ -73.9557413, 40.7720266 ],
		      },
		      "borough" : "Manhattan",
		      "cuisine" : "Italian",
		      "grades" : [
		         {
		            "date" : ISODate("2014-10-01T00:00:00Z"),
		            "grade" : "A",
		            "score" : 11
		         },
		         {
		            "date" : ISODate("2014-01-16T00:00:00Z"),
		            "grade" : "B",
		            "score" : 17
		         }
		      ],
		      "name" : "Taco Bell",
		      "restaurant_id" : "88888888"
		   }
		)

10. See if we can find it 

		db.restaurants.find({"name":"Taco Bell","restaurant_id":"88888888"}).pretty()

11. How about all restaurants in Brooklyn or the Bronx

		db.restaurants.find({'borough': { $in: ['Bronx', 'Brooklyn'] } } ).pretty()

		
