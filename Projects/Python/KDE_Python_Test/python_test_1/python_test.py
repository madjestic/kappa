'''
Documentation, License etc.

@package python_test

A "Hello, World!" Application
'''


'''
Generator->Iterator test
'''

foo = ['a', 99, 'c']#{"foo":10, "bar":20, "baz":30}

def iterObject():
  for i in foo:
    yield i

a = iterObject()
iter_a = iter(foo)

print iter_a.next()
iter_a.next()
print iter_a.next()

#if 'z' in foo:
  #print "found"
#else: 
  #print "not a member"
my_list = foo
value = 'a'
print filter(lambda x: x == 'z', my_list)