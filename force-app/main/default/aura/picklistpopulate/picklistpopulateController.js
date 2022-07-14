// Controller
({
    doInit: function(component, event, helper) {
        // Request from server
        var action = component.get("c.getAccountList");
        action.setCallback(this, function(result){
            var accounts = result.getReturnValue();
            console.log(accounts);
            component.set("v.accounts", accounts);
            // Let DOM state catch up.
            window.setTimeout(
                $A.getCallback( function() {
                    // Now set our preferred value
                    component.find("a_opt").set("v.value", accounts[2].Id);
                }));
        });
        $A.enqueueAction(action);
    }
})