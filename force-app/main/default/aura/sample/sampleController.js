({
    doInit: function(component, event, helper) {
         helper.fetchPickListVal(component, 'StageName', 'accIndustry');
       var action=component.get("c.OppById");
        debugger;
       // var oppId=component.get("v.recordId");
      //  action.setParams({"Opp_Id":component.get("v.recordId")});
        action.setCallback(this, function(response){
        var state=response.getState();
            if(state=== "SUCCESS"){
                alert(response.getReturnValue());
                component.set("v.opp", response.getReturnValue());
               // var lookup=component.get("v.selectedLookUpRecord").id;
             //   component.set("v.selectedLookUpRecord.id",response.getReturnValue().AccountId);
                component.find("accIndustry").set("v.value", response.getReturnValue().StageName);
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    onPicklistChange: function(component, event, helper) {
        // get the value of select option
        
        alert(event.getSource().get("v.value"));
    },
})