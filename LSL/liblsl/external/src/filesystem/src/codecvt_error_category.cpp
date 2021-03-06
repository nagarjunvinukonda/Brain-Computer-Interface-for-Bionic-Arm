//  codecvt_error_category implementation file  ----------------------------------------//

//  Copyright Beman Dawes 2009

//  Distributed under the Boost Software License, Version 1.0.
//  See http://www.lslboost.org/LICENSE_1_0.txt)

//  Library home page at http://www.lslboost.org/libs/filesystem

//--------------------------------------------------------------------------------------//

#include <lslboost/config/warning_disable.hpp>

// define BOOST_FILESYSTEM_SOURCE so that <lslboost/filesystem/config.hpp> knows
// the library is being built (possibly exporting rather than importing code)
#define BOOST_FILESYSTEM_SOURCE

#ifndef BOOST_SYSTEM_NO_DEPRECATED 
#  define BOOST_SYSTEM_NO_DEPRECATED
#endif

#include <lslboost/filesystem/config.hpp>
#include <lslboost/filesystem/path_traits.hpp>
#include <lslboost/system/error_code.hpp>
#include <locale>
#include <vector>
#include <cstdlib>
#include <cassert>

//--------------------------------------------------------------------------------------//

namespace
{
  class codecvt_error_cat : public lslboost::system::error_category
  {
  public:
    codecvt_error_cat(){}
    const char*   name() const;
    std::string    message(int ev) const;
  };

  const char* codecvt_error_cat::name() const
  {
    return "codecvt";
  }

  std::string codecvt_error_cat::message(int ev) const
  {
    std::string str;
    switch (ev)
    {
    case std::codecvt_base::ok:
      str = "ok";
      break;
    case std::codecvt_base::partial:
      str = "partial";
      break;
    case std::codecvt_base::error:
      str = "error";
      break;
    case std::codecvt_base::noconv:
      str = "noconv";
      break;
    default:
      str = "unknown error";
    }
    return str;
  }

} // unnamed namespace

namespace lslboost
{
  namespace filesystem
  {

    BOOST_FILESYSTEM_DECL const lslboost::system::error_category& codecvt_error_category()
    {
      static const codecvt_error_cat  codecvt_error_cat_const;
      return codecvt_error_cat_const;
    }

  } // namespace filesystem
} // namespace lslboost
