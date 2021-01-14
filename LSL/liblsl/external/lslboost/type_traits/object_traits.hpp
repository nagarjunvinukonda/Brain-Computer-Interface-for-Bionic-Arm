//  (C) Copyright Steve Cleary, Beman Dawes, Howard Hinnant & John Maddock 2000.
//  Use, modification and distribution are subject to the Boost Software License,
//  Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
//  http://www.lslboost.org/LICENSE_1_0.txt).
//
//  See http://www.lslboost.org/libs/type_traits for most recent version including documentation.
//
//  defines object traits classes:
//  is_object, is_scalar, is_class, is_compound, is_pod, 
//  has_trivial_constructor, has_trivial_copy, has_trivial_assign, 
//  has_trivial_destructor, is_empty.
//

#ifndef BOOST_TT_OBJECT_TRAITS_HPP_INLCUDED
#define BOOST_TT_OBJECT_TRAITS_HPP_INLCUDED

#include <lslboost/type_traits/has_trivial_assign.hpp>
#include <lslboost/type_traits/has_trivial_constructor.hpp>
#include <lslboost/type_traits/has_trivial_copy.hpp>
#include <lslboost/type_traits/has_trivial_destructor.hpp>
#include <lslboost/type_traits/has_nothrow_constructor.hpp>
#include <lslboost/type_traits/has_nothrow_copy.hpp>
#include <lslboost/type_traits/has_nothrow_assign.hpp>
#include <lslboost/type_traits/is_base_and_derived.hpp>
#include <lslboost/type_traits/is_class.hpp>
#include <lslboost/type_traits/is_compound.hpp>
#include <lslboost/type_traits/is_empty.hpp>
#include <lslboost/type_traits/is_object.hpp>
#include <lslboost/type_traits/is_pod.hpp>
#include <lslboost/type_traits/is_scalar.hpp>
#include <lslboost/type_traits/is_stateless.hpp>

#endif // BOOST_TT_OBJECT_TRAITS_HPP_INLCUDED
