// Trigger runs getLocation() on Accounts with no Geolocation
trigger SetGeolocation on Account (after insert, after update) {
    for (Account a : trigger.new){
         // System.debug([SELECT name, phone FROM account WHERE DISTANCE(Location__c, GEOLOCATION(78.794915,17.394733), 'mi') >1]);

        if (a.Location__Latitude__s == null){
            LocationCallouts.getLocation(a.id);
            System.debug(a);
         }
     }
            
}