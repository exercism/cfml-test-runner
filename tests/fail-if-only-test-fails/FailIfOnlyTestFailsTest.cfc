component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		SUT = createObject( 'FailIfOnlyTestFails' );
	}

	function run(){

		describe( 'FailIfOnlyTestFails', function(){

			it( 'This should fail', function(){
				expect( SUT.hello() ).toBe( 'Hello, World!' );
			});

		});

	}

}
