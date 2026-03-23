component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		SUT = createObject( 'ErrorIfSyntaxError' );
	}

	function run(){

		describe( 'ErrorIfSyntaxError', function(){

			it( 'This will error out', function(){
				expect( SUT.alwaysTrue() ).toBeTrue();
			});

		});

	}

}
