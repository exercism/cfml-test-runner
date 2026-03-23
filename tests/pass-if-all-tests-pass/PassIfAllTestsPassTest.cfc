component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		SUT = createObject( 'PassIfAllTestsPass' );
	}

	function run(){

		describe( 'PassIfAllTestsPass', function(){

			it( 'this should pass', function(){
				expect( SUT.leapYear( year='2015' ) ).toBeFalse();
			});

			it( 'this should also pass', function(){
				expect( SUT.leapYear( year='1996' ) ).toBeTrue();
			});

		});

	}

}
