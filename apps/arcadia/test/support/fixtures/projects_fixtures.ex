defmodule Arcadia.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Arcadia.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        url: "some url"
      })
      |> Arcadia.Projects.create_project()

    project
  end
end
