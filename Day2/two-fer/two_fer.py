def two_fer(name=None):
    if name is None:
        return "One for you, one for me."
    if isinstance(name, str):
        return "One for {}, one for me.".format(name)
    
    raise Exception("Invalid name, please enter a string")
