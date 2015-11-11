%macro saspairs_check_dups (varlist);
	%* --- check for duplicate names on a variable list;
	%let nwords = %saspairs_nwords(&long_varlist);
	%do i=1 %to (%eval(&nwords - 1);
		%let thisvar = %upcase(%scan(&long_varlist, &i, %str( )));
		%do j = %eval(&i+1) %to &nwords;
			%if &thisvar = %upcase(%scan(&long_varlist, &j, %str( ))) %then %do;
				%let abort_job=YES;
				%put ERROR: Duplicate variable name: &thisvar.;
				%let printit = &printit %str(print , "*** ERROR *** DUPLICATE VARIABLE NAME: &testword";);
			%end;
		%end;
	%end;
%mend;