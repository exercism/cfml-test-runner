component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		SUT = createObject( 'ErrorIfEmptyFile' );
	}

	function run(){

		describe( 'ErrorIfEmptyFile', function(){

			it( 'This should error', function(){
				expect( SUT.alwaysTrue() ).toBeTrue();
			});

		});

	}

}
