component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		SUT = createObject( 'PassIfOnlyTestPasses' );
	}

	function run(){

		describe( 'PassIfOnlyTestPasses', function(){

			it( 'This should pass', function(){
				expect( SUT.hello() ).toBe( 'Hello, World!' );
			});

		});

	}

}
