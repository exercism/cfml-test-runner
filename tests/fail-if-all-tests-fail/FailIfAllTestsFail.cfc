component {

	function leapYear( year ) {
		if ( year % 400 == 0 ) {
			return false;
		} else if ( year % 4 == 0 && year % 100 != 0 ) {
			return false;
		}
		return true;
	}

}
