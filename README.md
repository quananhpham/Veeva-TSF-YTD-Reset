Veeva-TSF-YTD-Reset
===========================

Zero out the TSF YTD Activity field (run on Dec 31st or Jan 1st)

How to Run
--------------
Option 1. Run manually via the SFDC Developer Console:
database.executebatch(new VEEVA_PS_TSF_YTD_RESET (),200); 

Or run in the SFDC Developer Console at a set schedule.  The following will schedule to run on Dec 31st.
VEEVA_PS_TSF_YTD_RESET c = new VEEVA_PS_TSF_YTD_RESET();
String s = '0 0 0 31 DEC ?';
system.schedule('Reset TSF Call YTD Values', s, c);

Option 2. Schedule a nightly routine, ideally on December 30th, 31st or January 1st.
Setup > Develop > Apex Classes > Schedule Apex
