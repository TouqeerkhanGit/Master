<aura:application >
	<aura:attribute name="GetIdFromUrl" type="String" default="this is default value"/>
    Value in GetIdFromUrl  Attribute: {!v.GetIdFromUrl}!
    
    <c:Opportunity_clone accGetID="{!v.GetIdFromUrl}"/>
</aura:application>