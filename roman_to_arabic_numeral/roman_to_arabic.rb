class RomanNumeral
    @result
    def initialize input
        @result = 0
        @input = input
        @romanMap = {
            'I' => 1,
            'V' => 5,
            'X' => 10,
            'L' => 50,
            'C' => 100,
            'D' => 500,
            'M' => 1000
        }

        @subtractPrefixes = [
            'I', 'X', 'C'
        ]

        @romanArray = [
            'I',
            'V',
            'X',
            'L',
            'C',
            'D',
            'M'
        ]

    end


    def to_arabic
        @result = 0
        inputArray = @input.split("")
        length = inputArray.length
        i = 0
        while i < length
            char = inputArray[i]
            flag = false
            if @subtractPrefixes.include?(char)
                if i < length - 1
                    nextChar = inputArray[i + 1]
                    romanIndex1 = @romanArray.index char
                    romanIndex2 = @romanArray.index nextChar
                    distance = romanIndex2 - romanIndex1
                    if distance > 0 && distance <= 2
                        @result += @romanMap[nextChar] - @romanMap[char]
                        i += 1
                        flag = true
                    end
                end
            end

            @result += @romanMap[char] if !flag

            i += 1
        end
        @result
    end

end
