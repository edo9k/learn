       identification division.
       program-id. paychecks.
       author. charles r. martin.
       date-written. 2020-apr-15.
       environment division.
       input-output section.
       file-control.
           select timecards
             assign to "timecards.dat"
               organization is line sequential.
       data division.
       file section.
       fd timecards.
       01 timecard.
           02 employee-name.
             03 emp-firstname pic x(10).
             03 emp-surname  pic x(15).
           02 hours-worked pic 99v9.
           02 pay-rate pic 99.
       working-storage section.
      * temporary variables
      * computing overtime pay
       01 regular-hours  pic 9(4)v99 usage comp.
       01 overtime-hours pic 9(4)v99 usage comp.
       01 overtime-rate  pic 9(4)v99 usage comp.
       01 regular-pay    pic 9(4)v99 usage comp.
       01 overtime-pay   pic 9(4)v99 usage comp.
      * computed parts of the paycheck
       01 gross-pay      pic 9(4)v99 usage comp.
       01 fed-tax        pic 9(4)v99 usage comp.
       01 state-tax      pic 9(4)v99 usage comp.
       01 fica-tax       pic 9(4)v99 usage comp.
       01 net-pay        pic 9(4)v99 usage comp.
      * print format for the check
       01 paycheck.
           02 prt-employee-name  pic x(25).
           02 filler             pic x.
           02 prt-hours-worked    pic 99.9.
           02 filler             pic x.
           02 prt-pay-rate       pic 99.9.
           02 prt-gross-pay      pic $,$$9.99.
           02 prt-fed-tax        pic $,$$9.99.
           02 prt-state-tax      pic $,$$9.99.
           02 prt-fica-tax       pic $,$$9.99.
           02 filler             pic x(5).
           02 prt-net-pay        pic $*,**9.99.
      * tax rates -- level 77
       77 fed-tax-rate   pic v999 value is .164 .
       77 state-tax-rate pic v999 value is .070 .
       77 fica-tax-rate  pic v999 value is .062 .
      * conditions -- level 88
       01 end-file       pic x.
             88 eof value "T".
       procedure division.
       begin.
           perform initialize-program.
           perform process-line with test before until eof
           perform clean-up.
           stop run.
       initialize-program.
           open input timecards.
       process-line.
           read timecards into timecard
             at end move "T" to end-file.
           if not eof then
             perform compute-gross-pay
             perform compute-fed-tax
             perform compute-state-tax
             perform compute-fica
             perform compute-net-pay
             perform print-check
           end-if.
       compute-gross-pay.
           if hours-worked > 40 then
             multiply pay-rate by 1.5 giving overtime-rate
             move 40 to regular-hours
             subtract 40 from hours-worked giving overtime-hours
             multiply regular-hours by pay-rate giving regular-pay
             multiply overtime-hours by overtime-rate
               giving overtime-pay
             add regular-pay to overtime-pay giving gross-pay
           else
             multiply hours-worked by pay-rate giving gross-pay
           end-if
           .
       compute-fed-tax.
           multiply gross-pay by fed-tax-rate giving fed-tax
           .
       compute-state-tax.
      * more familiar syntax
           compute state-tax = gross-pay * state-tax-rate
           .
       compute-fica.
           multiply gross-pay by fica-tax-rate giving fica-tax
           .
       compute-net-pay.
           subtract fed-tax state-tax fica-tax from gross-pay
             giving net-pay
           .
       print-check.
           move employee-name to prt-employee-name
           move hours-worked to prt-hours-worked
           move pay-rate to prt-pay-rate
           move gross-pay to prt-gross-pay
           move fed-tax to prt-fed-tax
           move state-tax to prt-state-tax
           move fica-tax to prt-fica-tax
           move net-pay to prt-net-pay
           display paycheck
           .
       clean-up.
            close timecards.
       end program paychecks.










      
       
