({
	Init : function (component, event, helper,object) {
		debugger;
		var getrecordid = component.get("v.recordId");
		var action = component.get("c.OppById");
		action.setParams({
             'Opp_Id': getrecordid
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            	
            	$A.get("e.force:closeQuickAction").fire();
            	helper.createQuote(component, event,helper,response.getReturnValue());
            }
        });
        $A.enqueueAction(action);

	}
})