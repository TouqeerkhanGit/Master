({
	createQuote : function (component, event, helper,object) {

        var createOppEvent = $A.get("e.force:createRecord");
		createOppEvent.setParams({
			"entityApiName": "Opportunity",
			"defaultFieldValues": {
				'Name' : object.Name,
			    'AccountId' : object.AccountId,
                'StageName' : object.StageName,
				'CloseDate' : object.CloseDate,
				'Type' : object.Type,
                'Probability':object.Probability,
				'LeadSource' : object.LeadSource,
                'Old_Id__c' :object.Id,
              
                
                


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