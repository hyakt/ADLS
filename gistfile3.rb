n = 10
s = [8, 5, 9, 2, 6, 3, 7, 1, 10, 4]

def merge(a, left, mid, right)

  n1 = mid - left
  n2 = right - mid

  l = (0..n1).to_a
  r = (0..n2).to_a
       
  l.each { |i| l[i] = a[left + i] }
  r.each { |i| r[i] = a[mid + i] }

  l[n1] = r[n2] = 10**9
  i = j = 0

  (left..right).each do |k|
    
    if l[i] <= r[j]
      a[k] = l[i]
      i = i+1
    else
      a[k] = r[j]
      j = j + 1
    end
  end
  
end


def mergeSort(a, left, right)
  if left + 1 < right
    mid = (left + right) / 2
    mergeSort(a, left, mid)
    mergeSort(a, mid, right)
    merge(a, left, mid, right)
  end
end

mergeSort(s, 0, n)
