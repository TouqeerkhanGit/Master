<aura:application extends="force:slds">
      <!-- <aura:attribute name="objInfoapp" type="Opportunity" default="{sobjectType : 'Opportunity'}" />
   <aura:attribute name="Selected" type="string" Default="Prospecting" />
    <c:CustomPicklist objInfo="{!v.objInfoapp}" fieldname="StageName" selected="{!v.Selected}" />-->
<!-- here c: is org. namespace prefix-->
    <c:OppWithProduct />
  </aura:application>