component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		SUT = createObject( 'FailIfSomeTestsFail' );
	}

	function run(){

		describe( 'FailIfSomeTestsFail', function(){

			it( 'this should pass', function(){
				expect( SUT.returnsTrue() ).toBeTrue();
			});

			it( 'this should fail', function(){
				expect( SUT.returnsTrue() ).toBeFalse();
			});

		});

	}

}
