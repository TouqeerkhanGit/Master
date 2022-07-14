<aura:application extends="force:slds" controller="LightningAccountController">
    <aura:attribute name="accounts" type="Account[]" />
    <aura:handler name="init" value="{!this}" action="{!c.doInit}" />

    <lightning:select label="Choose 1" name="a_opt" aura:id="a_opt" onchange="{!c.change}">
        <aura:iteration items="{!v.accounts}" var="account">
            <option value="{!account.Id}">{!account.Name}</option>
        </aura:iteration>
    </lightning:select>
</aura:application>