# Given an array nums, write a function to move all 0's to the end of it 
# while maintaining the relative order of the non-zero elements.
# Example:
# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
# Example Input: [0,0,11,2,3,4]					
# Example Output: [11,2,3,4,0,0]

# For loop, where index is '0' use Del, store into y variable, append back to the list

def movingzeros(list):
    nz = []
    z = []
    for i in range(len(list)):
        if list[i] != 0:
            nz.append(list[i])
        else:
            z.append(list[i])
    result = nz + z
    print(result)

list1 = [0,1,0,3,12]
movingzeros(list1)
list2 = [0,0,11,2,3,4]
movingzeros(list2)