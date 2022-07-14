({
	createQuote : function (component, event, helper,object) {

        var createOppEvent = $A.get("e.force:createRecord");
		createOppEvent.setParams({
			"entityApiName": "Product2",
			"defaultFieldValues": {
				'Name' : object.Name,
			    'Description' : object.Description,
                'Family' : object.Family,
				'ProductCode' : object.ProductCode,
				'QuantityUnitOfMeasure' : object.QuantityUnitOfMeasure,
                'StockKeepingUnit':object.StockKeepingUnit,
                'Old_Id__c':object.Id,
                          
                


				// 'BillingLatitude' : object.Account.BillingLatitude,
				// 'BillingLongitude' : object.Account.BillingLongitude,
				// 'BillingGeocodeAccuracy' : object.Account.BillingGeocodeAccuracy,

				// 'ShippingLatitude' : object.Account.ShippingLatitude,
				// 'ShippingLongitude' : object.Account.ShippingLongitude,
				// 'ShippingGeocodeAccuracy' : object.Account.ShippingGeocodeAccuracy,

				// 'QuoteToLatitude' : object.Account.BillingLatitude,
				// 'QuoteToLongitude' : object.Account.BillingLongitude,
				// 'QuoteToGeocodeAccuracy' : object.Account.BillingGeocodeAccuracy,
			}

		});
      

		createOppEvent.fire();
	}
})