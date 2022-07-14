({
    doInit: function(component, event, helper) {
    
       var field=component.get("v.fieldname");
        var obj=component.get("v.objInfo");
   
        helper.fetchPickListVal(component, field, 'accIndustry');
        var selectedvalue=component.get("v.selected"); 
         debugger;
       alert('check1=completd');
      },
    doaction: function(component, event, helper) {
        var selectedvalue=component.get("v.selected"); 
         debugger;
//        alert('check1='+selectedvalue);
        var listvalue=component.find("accIndustry").get("v.value");
          if($A.util.isUndefinedOrNull(selectedvalue) || selectedvalue!=listvalue){
        var field=component.get("v.fieldname");
        helper.fetchPickListVal(component, field, 'accIndustry');
        var selectedvalue=component.get("v.selected"); 
         debugger;
//        alert('check1='+selectedvalue);
        var listvalue=component.find("accIndustry").get("v.value");
//        
               
        component.find("accIndustry").set("v.value",selectedvalue);
         }
     },
     
    onPicklistChange: function(component, event, helper) {
        // get the value of select option
        
       // alert(event.getSource().get("v.value"));
             var selectedvalue1=event.getSource().get("v.value");
             component.set("v.selected",selectedvalue1);
         
               // alert('check2='+selectedvalue1);
       // component.find("accIndustry").set("v.value", component.get("v.selected"));
    },
})