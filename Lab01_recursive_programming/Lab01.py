# 5. a. Determine the greatest common divisors of elements from a list.
# b. Insert an element on the n-position in a list.

# recursive function for gcd determination
def gcd(a,b):
     
    # Everything divides 0 
    if (b == 0):
         return a
    return gcd(b, a%b)

# function which pops the first element
def pop_first(l):
    l.reverse()
    first = l.pop()
    l.reverse()
    return first


# a) Determine the greatest common divisors of elements from a list.

def gcd_list(l):
    if len(l) == 0:
        return None
    if len(l) == 1:
        return l[0]
    if len(l) == 2:
        return gcd(l[0],l[1])
    else:
        l[0] = gcd(pop_first(l),l[0])
        return gcd_list(l)


# Test run
print('')
print('Test run for a) Determine the greatest common divisors of elements from a list.')

l=[10,15,20,25,30]
l2=[6]
l3=[]
l4=[722,844,964]
l5=[17,51,102]

print('gcd for l1 is ',gcd_list(l))
print('gcd for l2 is ',gcd_list(l2))
print('gcd for l3 is ',gcd_list(l3))
print('gcd for l4 is ',gcd_list(l4))
print('gcd for l5 is ',gcd_list(l5))

# b) Insert an element on the n-position in a list.

def add_first(elem,l):
    l.insert(0,elem)
    return l


def add_element(position, elem, l):
    if len(l) == 0:
        return []
    if position > 0 :
        return add_first(pop_first(l),add_element(position-1, elem, l ) ) 
    elif position == 0:
        return add_first(elem,add_element(position-1, elem, l ) ) 
    return l

# Test run
print('')
print('Test run for b) Insert an element on the n-position in a list.')

l6=[]
l7=[722,844,964]
l8=[17,51,102]
l9=[10,15,20,25]

add_element(3,13,l6)
print('insert 3 on empty list',l6)
add_element(1,3,l7)
print('insert 3 on 1st pos list',l7)
add_element(2,3,l8)
print('insert 3 on 2nd pos list',l8)
add_element(2, 44, l9)
print('insert 44 on 2rd pos list',l9)
print('')

