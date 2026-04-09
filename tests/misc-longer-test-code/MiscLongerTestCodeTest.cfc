component extends="testbox.system.BaseSpec" {

	function run(){

		describe( 'MiscLongerTestCode', function(){

			it( 'reports multiline test code', function(){
				SUT = new MiscLongerTestCode();
				SUT.write( 1 );
				expect( SUT.read() ).toBe( 1 );
			});

			it( 'reports multiple expects', function(){
				SUT = new MiscLongerTestCode();
				SUT.write( 1 );
				SUT.write( 2 );
				expect( SUT.read() ).toBe( 1 );
				expect( SUT.read() ).toBe( 2 );
			});

		});

	}

}
