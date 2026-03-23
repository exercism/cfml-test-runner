component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		SUT = createObject( 'FailIfAllTestsFail' );
	}

	function run(){

		describe( 'FailIfAllTestsFail', function(){

			it( 'this should fail', function(){
				expect( SUT.leapYear( year='2015' ) ).toBeFalse();
			});

			it( 'this should also fail', function(){
				expect( SUT.leapYear( year='1996' ) ).toBeTrue();
			});

		});

	}

}
