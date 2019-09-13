package sbuilder

import (
	"strings"
	"testing"
)

var str = `well they might wear classic reeboks
or knackered converse
or tracky bottoms tucked in socks
but all of that's what the point is not
the point is there ain't no romance around there
but that's the truth that they can't see
they probably like to throw a punch at me and
if you could only see them then you would agree
agree that there ain't no romance around there
you know oh it's a funny thing you know
tell them if you like
tell them all tonight they'll never listen
cos their minds are made up
and of cos it's all okay
to carry on that way
over there there's broken bones
there's only music so that there's new ringtones
it doesn't take no sherlock holmes
to see it's a little different around here
don't get me wrong notice boys in bands
and kids who like to scrape with pool cues in their hands
just because they've had a coupla cans
they think it's alright to act like a dickhead`

var byt = []byte(str)

var arr = strings.Split(str, "\n")

var _str string //nolint

func BenchmarkStringConcatParallel(b *testing.B) {
	b.ReportAllocs()
	b.SetParallelism(100)
	b.RunParallel(func(pb *testing.PB) {
		var ret string
		for pb.Next() {
			ret = StringConcat(arr)
			_str = ret
		}
	})
}

func BenchmarkStringBuilderParallel(b *testing.B) {
	b.ReportAllocs()
	b.SetParallelism(100)
	b.RunParallel(func(pb *testing.PB) {
		var ret string
		for pb.Next() {
			ret = StringBuilder(arr)
			_str = ret
		}
	})
}

func BenchmarkStringBuilderFixedSizeParallel(b *testing.B) {
	b.StopTimer()
	cnt := 0
	for _, line := range arr {
		cnt += len([]byte(line))
	}
	b.StartTimer()

	b.ReportAllocs()
	b.SetParallelism(100)
	b.RunParallel(func(pb *testing.PB) {
		var ret string
		for pb.Next() {
			ret = StringBuilderFixedSize(arr, cnt)
			_str = ret
		}
	})
}
