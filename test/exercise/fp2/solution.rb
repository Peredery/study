module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        e, *rest = self
        func.call(e)
        rest = MyArray.new(rest)
        rest.my_each(&func) if rest.any?
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |acc, e| acc << yield(e) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, e| e.nil? ? acc : acc << e }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        e, *rest = self
        acc = acc.nil? ? e : func.call(acc, e)
        return acc if rest.empty?

        MyArray.new(rest).my_reduce(acc, &func)
      end
    end
  end
end
