def two_fer(name='you'):

    if isinstance(name, str):
        return "One for {}, one for me.".format(name)
    
    raise Exception("Invalid name, please enter a string")
