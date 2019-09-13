package sbuilder

import "strings"

func StringConcat(ss []string) string {
	var str string
	for i, ln := 0, len(ss); i < ln; i++ {
		str += ss[i]
		str += "\n"
	}
	return str
}

func StringBuilder(ss []string) string {
	var b strings.Builder
	for i, ln := 0, len(ss); i < ln; i++ {
		b.WriteString(ss[i])
		b.WriteString("\n")
	}
	return b.String()
}

func StringBuilderFixedSize(ss []string, size int) string {
	var b strings.Builder
	b.Grow(size + len(ss)) // for newline
	for i, ln := 0, len(ss); i < ln; i++ {
		b.WriteString(ss[i])
		b.WriteString("\n")
	}
	return b.String()
}
