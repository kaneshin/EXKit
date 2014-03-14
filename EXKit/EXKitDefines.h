// EXKitDefines.h
//
// Copyright (c) 2014 Shintaro Kaneko (http://kaneshinth.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#ifndef __EXKIT_DEFINES_H__
#define __EXKIT_DEFINES_H__


#define EXKIT_DEBUG 1


/* Definition of `EXLog'. */
#if defined(EXKIT_DEBUG) && EXKIT_DEBUG == 1
# define EXLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
# define EXLog(...)
#endif /* defined(EXKIT_DEBUG) */


/* Definition of `EXErrorLog'. */
#define EXErrorLog(error) (EXLog(@"Unresolved error %@, %@", (error), ([(error) userInfo])))


/* Definition of `EXKIT_EXTERN'. */
#if !defined(EXKIT_EXTERN)
# if defined(__cplusplus)
#  define EXKIT_EXTERN extern "C"
# else
#  define EXKIT_EXTERN extern
# endif
#endif /* !defined(EXKIT_EXTERN) */


/* Definition of `EXKIT_STATIC_INLINE'. */
#if !defined(EXKIT_STATIC_INLINE)
# if defined(__cplusplus)
#  define EXKIT_STATIC_INLINE static inline
# elif defined(__GNUC__)
#  define EXKIT_STATIC_INLINE static __inline__
# else
#  define EXKIT_STATIC_INLINE static    
# endif
#endif /* !defined(EXKIT_STATIC_INLINE) */


#endif /* __EXKIT_DEFINES_H__ */