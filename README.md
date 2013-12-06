Veeva-TSF-YTD-Reset
===========================

Zero out the TSF YTD Activity field (run on Dec 31st or Jan 1st)

How to Run
--------------
Option 1. Run manually via the SFDC Developer Console:
database.executebatch(new VEEVA_PS_TSF_YTD_RESET (),200); 
	
Option 2. Schedule a nightly routine, ideally on December 30th, 31st or January 1st.
Setup > Develop > Apex Classes > Schedule Apex
