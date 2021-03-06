component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Leap' );
	}

	function run(){
	
		describe( "My Leap class", function(){			

			it( 'year not divisible by 4: common year', function(){
				expect( SUT.leapYear( year='2015' ) ).toBeFalse();
			});

			it( 'year divisible by 4, not divisible by 100: leap year', function(){
				expect( SUT.leapYear( year='1996' ) ).toBeTrue();
			});

		});
		
	}
 
}