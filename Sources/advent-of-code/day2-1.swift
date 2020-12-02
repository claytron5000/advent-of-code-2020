

func ~=(pattern: String, value: ParsedThing) -> Bool {
	let target = value.key.target
	let max = value.key.max
	let min = value.key.min
	let password = value.password
	
	let num = countInstanceOfTarget(targ, password)
	if( min <= num <= max) {
		// do the thing
	}
}
