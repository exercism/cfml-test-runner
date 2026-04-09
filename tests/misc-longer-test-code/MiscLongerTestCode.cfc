component {

	MiscLongerTestCode function init () {
		variables.data = [];
		return this;
	}

	numeric function read() {
		var value = variables.data[ 1 ];
		variables.data.deleteAt( 1 );
		return value;
	}

	void function write( required numeric value ) {
		variables.data.append( arguments.value );
	}

}
