global class VEEVA_PS_TSF_YTD_RESET implements Database.Batchable<sObject>,Schedulable  {

    /**************************************************************************
        VEEVA_PS_TSF_YTD_RESET 
        December 5, 2013
        Version 1.0
        
        Summary
        --------------
        Two routines are available to handle new year for the YTD activity flag:
        1. VEEVA_PS_TSF_YTD_RESET - zero out the TSF YTD Activity field (run on Dec 31st or Jan 1st)
        2. VEEVA_PS_TSF_YTD_CALC - zero out and re-calculate the TSF YTD Activity field  for current calendar year (can be run at any time in the year)
        
        VEEVA_PS_TSF_YTD_CALC may take long time to complete for large TSF volume.
        VEEVA_PS_TSF_YTD_RESET will run faster than VEEVA_PS_TSF_YTD_CALC as it does not have call2_vod__c queries.
        
        How to Run
        --------------
        Option 1. Run manually via the SFDC Developer Console:
        database.executebatch(new VEEVA_PS_TSF_YTD_RESET(),200); 
        
        Option 2. Schedule a nightly routine to run on Dec 31st or Jan 1st.
        Setup > Develop > Apex Classes > Schedule Apex
    **************************************************************************/
    
    global VEEVA_PS_TSF_YTD_RESET(){

    
    }

    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('select Id, YTD_Activity_vod__c from TSF_vod__c');
    }

    global void execute(SchedulableContext ctx) {        
        database.executebatch(new VEEVA_PS_TSF_YTD_RESET(),200); 
    } 

    global void execute(Database.BatchableContext BC,  List<sObject> scope){
        List<TSF_vod__c> tsf = new List<TSF_vod__c>();
        
        for(TSF_vod__c t : (List<TSF_vod__c>) scope) {
                        
            t.YTD_Activity_vod__c = 0;
            tsf.add(t);
        }
        
        update tsf;
    }

    global void finish(Database.BatchableContext BC) {}
}
