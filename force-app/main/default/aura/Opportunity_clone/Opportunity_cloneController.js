({
	OpportList : function(component, event, helper) {
        var action=component.get("c.OppById");
        debugger;
        var oppId=component.get("v.recordId");
        action.setParams({"Opp_Id":component.get("v.recordId")});
        action.setCallback(this, function(response){
        var state=response.getState();
            if(state=== "SUCCESS"){
                component.set("v.Opp", response.getReturnValue());
               // var lookup=component.get("v.selectedLookUpRecord").id;
             //   component.set("v.selectedLookUpRecord.id",response.getReturnValue().AccountId);
                        var opportunity = component.get("v.Opp");
                alert('Selectcheck '+opportunity.StageName);
                component.set("v.select",opportunity.StageName);
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
     },
    doAction: function(component, event) {
        
        var change=component.get("v.Opp.LeadSource");
        alert('Lead Source' +change);
    },
  createOppor : function(component, event) {
      debugger;
 
      //console.log('Create record');
      //var SelectResultFromOption = component.find("visTo").get("v.value");
	var change=component.get("v.Opp.LeadSource");
        alert('Lead Source' +change);
      
        //getting the candidate information
        var opportunity = component.get("v.Opp");
      
         var selectedstage = opportunity.StageName;
      alert('stage:' +selectedstage);
      
        
        //Validation
        if($A.util.isEmpty(opportunity.Name) || $A.util.isUndefined(opportunity.Name)){
            alert('First Name is Required');
            return;
        }            
        if($A.util.isEmpty(opportunity.StageName) || $A.util.isUndefined(opportunity.StageName)){
            alert('Last Name is Rqquired');
            return;
        }
        if($A.util.isEmpty(opportunity.Type) || $A.util.isUndefined(opportunity.Type)){
            alert('Type is Required');
            return;
        }
        if($A.util.isEmpty(opportunity.CloseDate) || $A.util.isUndefined(opportunity.CloseDate)){
            alert('SSN is Required');
            return;
        }
        //Calling the Apex Function
        var action = component.get("c.saveOpport");
        
        //Setting the Apex Parameter
        action.setParams({
             opp: opportunity
        });
        
        //Setting the Callback
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                var newCandidate = {'sobjectType': 'Opportunity',
                     'Name': '',
                     'StageName':''
                     ,'Type':'',
                       'CloseDate':''
                   };
                //resetting the Values in the form
                component.set("v.opp",newCandidate);
                alert('Record is Created Successfully');
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        
        
        
        });
    $A.enqueueAction(action)
},
})