 //2. Build a basic lightning component that can query a list of 10 most recently created accounts and display it using a lightning app.
// step.3 Create a JavaScript Controller for the Lightning Component (RecentAccountsController.js):
({
    doInit : function(component, event, helper) {
        var action = component.get("c.getRecentAccounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.accounts", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})
